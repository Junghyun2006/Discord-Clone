import React, { useState } from "react";
import { useDispatch } from "react-redux";
import ConversationCreateII from "../friend/conv_create_f_ii";
import { createConversation } from "../../actions/conversation_actions";
import { useHistory } from "react-router";

const ConversationCreate = ({ friends, currentUser }) => {
  const [convMembers, setConvMembers] = useState([]);
  const [memberCount, setMemberCount] = useState(9);
  const dispatch = useDispatch();
  const history = useHistory();

  const addConvMember = (member) => {
    setConvMembers([...convMembers, member]);
  };

  const incMemberCount = () => setMemberCount(memberCount + 1);
  const decMemberCount = () => setMemberCount(memberCount - 1);

  const removeConvMember = (member) => {
    const removed = convMembers.filter(
      (mem) => mem.username !== member.username
    );
    setConvMembers(removed);
  };

  const ccFriendIndex = Object.values(friends).map((friend, i) => {
    return (
      <ConversationCreateII
        friend={friend}
        key={i}
        addConvMember={addConvMember}
        removeConvMember={removeConvMember}
        incMemberCount={incMemberCount}
        decMemberCount={decMemberCount}
        memberCount={memberCount}
      />
    );
  });

  const memberTrack = convMembers.map((member, i) => {
    return (
      <div className="member-add-box" key={i}>
        <button className="member-add-button">{member.username}</button>
      </div>
    );
  });

  const log = () => {
    let name = ''
    name += currentUser.username;
    let users = [currentUser.id]

    convMembers.forEach(member => {
        name += ", " + member.username;
        users.push(member.id)
    })
    const conversation = {name, users}
    dispatch(createConversation(conversation, history))
  };

  const memberLabel = (memberCount === 0) ? (
            <h1 className="conv-create-header-two"> This group has a 10 member limit.</h1>) : (<h1 className="conv-create-header-two">
            You can add&nbsp;{memberCount}&nbsp;more friends.
          </h1>)

  return (
    <>
      <div className="conversation-create-container">
        <div className="conversation-create-sec-one">
          <h1 className="conv-create-header">SELECT FRIENDS</h1>
          {memberLabel}
          <div className="conv-c-button-holder">
            {memberTrack}
            <div className="conv-c-search">
              <input
                className="conv-create-input"
                type="text"
                placeholder="Type the username of a friend"
              />
            </div>
          </div>
        </div>
        <div className="conv-create-friend-index">{ccFriendIndex}</div>
        <div className="conv-create-btn-container">
          <button className="conv-create-btn" onClick={() => log()}>
            Create Group DM
          </button>
        </div>
      </div>
    </>
  );
};

export default ConversationCreate;
