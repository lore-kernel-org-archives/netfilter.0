From: Jim Garrison <jhg@acm.org>
Subject: h323-conntrack-nat and NetMeeting - Question
Date: Sat, 28 Dec 2002 12:51:47 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E0DF2C3.1010707@acm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Setup:

       Windows2000 SP3 with NetMeeting 3.01 behind a RedHat 7.3
       firewall with kernel 2.4.20 from kernel.org plus the
       newnat-udp-helper and h323-conntrack-nat patches from
       POM (z-newnat16 showed as 'already applied').

I am able to initiate outgoing NetMeeting connections.
However, when I initiate such a connection, I do not receive
video from the other party.  I don't currently have a camera
so I can't tell if outgoing video works.

Here are the symptoms:

1) No video window appears, even though "Video/Receive"
     and "Automatically receive video" are both enabled in
     NetMeeting.  The other party has a proven working setup
     that is used regularly for audio/video with other people,
     so that's not in question.

2) Even when I have a good audio connection to the other
     party, and the main NetMeeting window displays "In a call",
     the sharing tools (share app, chat, whiteboard and file
     transfer) all display "Not in a call" in their title bars,
     and don't transmit or receive data.

In addition to installing the POM patches I have configured
iptables to allow all traffic between my host and the specific
remote IP address of the other party.

Anyone have suggestions on how to fix and/or debug this further?

I have ethereal on the firewall and am relatively adept at
interpreting its output, though I don't know much about the
specific protocols used in NetMeeting.  I assume that both
the audio and video streams are sent in UDP packets.  What
do I look for in the data stream to tell if I'm even receiving
video?  Is it possible to tell by examining the packets?

-- 
Jim Garrison (jhg@acm.org)
PGP Keys at http://www.jhmg.net RSA 0x04B73B7F DH 0x70738D88





