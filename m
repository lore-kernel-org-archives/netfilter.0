From: Bob Keyes <bob@sinister.com>
Subject: Re: sendto: No buffer space available
Date: Mon, 2 Dec 2002 09:33:23 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0212020932180.16752-100000@Sinister.Com>
References: <571705138.20021202111645@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <571705138.20021202111645@pobox.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andre Docena Correa <andre.docena@pobox.com>
Cc: netfilter@lists.netfilter.org

What does netstat -n show you?
I have seen this error when there are thousands of TCP connections open at
the same time (this was using the 'naptha' DoS demonstration tool I
wrote).

On Mon, 2 Dec 2002 andre.correa@pobox.com wrote:

>
> Hi list,
>
> I  have  a  Linux  2.4.19  box  doing NAT, PPPoE, Traffic Shapping and
> Firewalling.  It  is  a  2xPIII  733MHz with 512Mb RAM. Everything was
> working  just  fine  until 5 or 6 days ago we started having some strange
> behavior.
>
> Under  moderate  traffic,  15  to  20  NAT users, we find that traffic
> suddenly  stops  for 10 or 15 seconds and then comes back. During this
> periods  I've  figured  out  that  if I ping my interfaces or Internet
> addresses I get:
>
> sendto: No buffer space available
> ping: sent 64 octets to xxx.xxx.xxx.xxx, ret=-1
>
> I've  made  lots  of  searchs  in  mailling lists, Internet and in the
> kernel  source  but couldn't work on it.
>
> Can you guys help me to solve this problem?
>
> tks in advance for your help and attention.
>
> Andre
> andre.correa@pobox.com
>
>
>


