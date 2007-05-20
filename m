From: "Jonny K" <mrjk600@gmail.com>
Subject: Re: Help with DOS attack
Date: Sun, 20 May 2007 21:02:08 +0300
Message-ID: <cce02b410705201102yd7e5854r419a977deb5df14f@mail.gmail.com>
References: <cce02b410705192222s38bc0562g47aef08eba4e7@mail.gmail.com>
	<cce02b410705192228r42bf262aj2e5367ef3db02d74@mail.gmail.com>
	<73427AD314CC364C8DF0FFF9C4D693FF037B34@nehemiah.joris2k.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=QuaJZ6Dd7lPjM4Ip7t5cTkxRjEUS4KkqVMhF8XuBEHjhvZDs3TNJtDocLRzZSf2P+T9kbDAp71PsPAnH+e9mufT0NRnRs+v49hKboZp0PtAz8PBIdOkksg6BDPm60K2sP69Er7JRf2PV9DSA+7KnLR+mpqV0C++fmGKILcDj0e4=
In-Reply-To: <73427AD314CC364C8DF0FFF9C4D693FF037B34@nehemiah.joris2k.local>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Well i realize that my system is down at 6am while the tcpsyncookies was 1

anything else

On 5/20/07, Joris Dobbelsteen <Joris@familiedobbelsteen.nl> wrote:
> Two things you probably want to do:
>
> 1)
> Enable Syn cookies (disables use of the TCP backlog). Its used in most
> systems to reduce the effects of a SYN flooding attack.
>
> 2)
> Contact your ISP. They can usually help you with such problems. In
> general they are not happy with attacks directed to their networks.
>
> - Joris
>
> >-----Original Message-----
> >From: netfilter-bounces@lists.netfilter.org
> >[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jonny K
> >Sent: zondag 20 mei 2007 7:28
> >To: netfilter@lists.netfilter.org
> >Subject: Re: Help with DOS attack
> >
> >> it looks like someone dos attack my server any ideas how i
> >can handle
> >> it ?
> >>
> >> (i allready sysctl and change the backlog queue to 4096
> >insted of 1024   and i mange SYN timeout to 9 sec)
> >>
> >> any other ideas ?
> >>
> >>
> >> here is my netstat outputs
> >>
> >>
> >> [root@MYHOST ~]# netstat -an | grep SYN_REC  | wc
> >>     372    2232   33108
> >> [root@MYHOST ~]#
> >>
> >>
> >>
> >>
> >> Ip:
> >>     496709034 total packets received
> >>     0 forwarded
> >>
> >>     0 incoming packets discarded
> >>     496547054 incoming packets delivered
> >>     389034562 requests sent out
> >>     55 fragments dropped after timeout
> >>     499 reassemblies required
> >>     54 packets reassembled ok
> >>
> >>     55 packet reassembles failed
> >>     2 fragments received ok
> >> Icmp:
> >>     17083 ICMP messages received
> >>     25 input ICMP message failed.
> >>     ICMP input histogram:
> >>         destination unreachable: 11255
> >>
> >>         timeout in transit: 1579
> >>         source quenches: 353
> >>         echo requests: 3880
> >>         echo replies: 16
> >>     24339 ICMP messages sent
> >>     0 ICMP messages failed
> >>     ICMP output histogram:
> >>         destination unreachable: 20459
> >>
> >>         echo replies: 3880
> >> Tcp:
> >>     33725 active connections openings
> >>     38693945 passive connection openings
> >>     312156 failed connection attempts
> >>     521243 connection resets received
> >>     3 connections established
> >>
> >>     495811236 segments received
> >>     388303537 segments send out
> >>     14565173 segments retransmited
> >>     10279 bad segments received.
> >>     136512 resets sent
> >> Udp:
> >>     718164 packets received
> >>     571 packets to unknown port received.
> >>
> >>     0 packet receive errors
> >>     720360 packets sent
> >> TcpExt:
> >>     421 SYN cookies sent
> >>     99 SYN cookies received
> >>     43807 invalid SYN cookies received
> >>     1188232 resets received for embryonic SYN_RECV sockets
> >>
> >>     14 packets pruned from receive queue because of socket
> >buffer overrun
> >>     221 ICMP packets dropped because they were out-of-window
> >>     71 ICMP packets dropped because socket was locked
> >>     34829434 TCP sockets finished time wait in fast timer
> >>
> >>     2 time wait sockets recycled by time stamp
> >>     15358 packets rejects in established connections because
> >of timestamp
> >>     256833 delayed acks sent
> >>     2653 delayed acks further delayed because of locked socket
> >>
> >>     Quick ack mode was activated 119773 times
> >>     74580 times the listen queue of a socket overflowed
> >>     74580 SYNs to LISTEN sockets ignored
> >>     39205589 packets directly queued to recvmsg prequeue.
> >>     8376974 packets directly received from backlog
> >>
> >>     2265096902 packets directly received from prequeue
> >>     806823 packets header predicted
> >>     36687371 packets header predicted and directly queued to user
> >>     238781476 acknowledgments not containing data received
> >>
> >>     125709890 predicted acknowledgments
> >>     29275 times recovered from packet loss due to fast retransmit
> >>     1927589 times recovered from packet loss due to SACK data
> >>     1362 bad SACKs received
> >>     Detected reordering 6628 times using FACK
> >>
> >>     Detected reordering 4312 times using SACK
> >>     Detected reordering 4875 times using reno fast retransmit
> >>     Detected reordering 11976 times using time stamp
> >>     6435 congestion windows fully recovered
> >>
> >>     66640 congestion windows partially recovered using Hoe heuristic
> >>     TCPDSACKUndo: 957
> >>     16664 congestion windows recovered after partial ack
> >>     4188573 TCP data loss events
> >>     TCPLostRetransmit: 1192
> >>
> >>     5491 timeouts after reno fast retransmit
> >>     260050 timeouts after SACK recovery
> >>     200153 timeouts in loss state
> >>     6505780 fast retransmits
> >>     695080 forward retransmits
> >>     4881678 retransmits in slow start
> >>
> >>     1084146 other TCP timeouts
> >>     TCPRenoRecoveryFail: 14786
> >>     306771 sack retransmits failed
> >>     2225 times receiver scheduled too late for direct processing
> >>     294 packets collapsed in receive queue due to low socket buffer
> >>
> >>     121753 DSACKs sent for old packets
> >>     64 DSACKs sent for out of order packets
> >>     1007539 DSACKs received
> >>     1099 DSACKs for out of order packets received
> >>     10295 connections reset due to unexpected data
> >>
> >>     102 connections reset due to early user close
> >>     64688 connections aborted due to timeout
> >>
> >>
> >
> >
>
>

