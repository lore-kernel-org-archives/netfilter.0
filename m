From: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Subject: iptables detecting voip packet
Date: 1 Jul 2002 04:51:12 -0000
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020701045112.14139.qmail@webmail7.rediffmail.com>
Reply-To: "ganesh kumar godavari" <gkgodava@rediffmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain;
	format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

Hi all,
  i have a question regarding identifying a voip connection. 
following is the information i got from 
http://support.microsoft.com/default.aspx?scid=kb;EN-US;q158623

NetMeeting uses the following Internet Protocol (IP) ports:

    Port      Purpose
    -------------------------------------
    389       Internet Locator Server (TCP)
    522       User Location Server (TCP)
    1503      T.120 (TCP)
    1720      H.323 call setup (TCP)
    1731      Audio call control (TCP)
(*)Dynamic   H.323 call control (TCP)
(*)Dynamic   H.323 streaming [RTP over UDP]

To establish outbound NetMeeting connections through a firewall, 
the firewall must be configured to do the following: Pass through 
primary TCP connections on ports 522, 389, 1503, 1720 and 1731.

  i want to give maximum throughput to voip packets, the ports are 
dynamic[indicated by * above]. is there any way i can check if the 
packet is a voip ?

Thanks a mil,

---
ganesh
_________________________________________________________
There is always a better job for you at Monsterindia.com.
Go now http://monsterindia.com/rediffin/


