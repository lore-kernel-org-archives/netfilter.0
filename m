From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: "CE" - Where's the  snot?
Date: Sat, 24 Jul 2004 21:37:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407242137.11257.Antony@Soft-Solutions.co.uk>
References: <1090682116.3343.7.camel@dchws.tqmcube.com> <200407241644.01366.Antony@Soft-Solutions.co.uk> <1090700564.10960.2.camel@dchws.tqmcube.com>
Reply-To: NetFilter List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1090700564.10960.2.camel@dchws.tqmcube.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: NetFilter List <netfilter@lists.netfilter.org>

On Saturday 24 July 2004 9:22 pm, David Cary Hart wrote:

> On Sat, 2004-07-24 at 11:44, Antony Stone wrote:
> > Excuse me, but *what* are you seeing?
> >
> > I can see the subject of this posting, but it means nothing to me.
> >
> > Please explain the problem so we can understand what it is.
>
> Jul 24 16:21:01 mail kernel: - Firewall:  IN=eth0 OUT=
> MAC=00:4f:4e:12:f9:93:00:09:5b:c9:37:54:08:00  SRC=68.236.163.19 D
> ST=192.168.0.31 LEN=41 TOS=00 PREC=0x00 TTL=126 ID=59477 CE DF PROTO=TCP
> SPT=4694 DPT=135 SEQ=4252944646 ACK=3536024229 WIND
> OW=64320 ACK URGP=0
>
> Note the "CE" just in front of "DF" = Congestion Experienced

It seems that the CE bit is set by some router in the path of the packets, 
therefore this is unlikely to be a problem on your network or firewall 
(unless you have your own routers perhaps).

http://www.zvon.org/tmRFC/RFC2884/Output/chapter3.html

A Google search for TCP and Congestion Experienced should give you a good 
background into why this bit may get set, however I don't think there's a way 
to find out which router set it.

Is it causing you any problems?

Regards,

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - New York Times, following a demonstration at the 1939 World's Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


