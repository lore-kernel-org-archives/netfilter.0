From: Emanoil Kotsev <emanuel@abc.at>
Subject: Re: Info about H.323
Date: Wed, 02 Apr 2003 18:40:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E8B1297.E9B91696@abc.at>
References: <008c01c2f89d$f6556260$0101a8c0@matteocasa>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------96A09B0E74D69335D519C07F"
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
To: Matteo <matteo@oldamerika.com>
Cc: netfilter@lists.netfilter.org


--------------96A09B0E74D69335D519C07F
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
forgot to tell you in case you don't know, that if your machine is the
onlyone behind the firewall, you can just forward Port 1720 to the
Client

Also 30000:30010 and 5003:5005 whould be open accepting
RELATED,ESTABLISHED traffic

in this case you should be able to receive voice&video to and only to
your client that you are forwarding to.

good luck

Matteo wrote:

>  Dear, the patch for Kernel is P-O-M ??? so it is I try install and
> then I tell you if it work... Bye Mat
> ----- Original Message -----
> I have the same problem and no time to work on solution.
> As far as I know there is a patch for the kernel to add support H.323
> into iptables.
> As I said I don't have anytime to work on a kernel and iptables
> configuration but if you manage to compile and configure H.323 support
> with IPtables me  and my friends are going to be ver thankful if you
> post a mail.
>
> good luck
>
> Matteo wrote:
>
>> Hello,I have a server linux with redhat 7.3 and shorewall as
>> firewall, now I try to set protocol H.323 becouse I must receive
>> strem video in multicast that use H.323....Now infact when I try to
>> connect to Strem video I don't see anythings when if I try connect
>> my pc directly to modem cable that it support h.323 strem video work
>> at 100%.Now I want use firewall in front of my pc and so I must set
>> H.323.... How set it ??? how set iptable ?? I must use P-O-M ?? If
>> yes, How I use P-O-M ??? Thank youMatteo
>
> --
> + Emanoil Kotsev - - - - -+
> | tel. 0043(1)9253175     |
> | cel. --------------     |
> + E-Mail: emanuel@abc.at  +
>
>

--
+ Emanoil Kotsev - - - - -+
| tel. 0043(1)9253175     |
| cel. --------------     |
+ E-Mail: emanuel@abc.at  +



--------------96A09B0E74D69335D519C07F
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<body bgcolor="#FFFFFF">
Hi,
<br>forgot to tell you in case you don't know, that if your machine is
the onlyone behind the firewall, you can just forward Port 1720 to the
Client
<p>Also 30000:30010 and 5003:5005 whould be open accepting RELATED,ESTABLISHED
traffic
<p>in this case you should be able to receive voice&amp;video to and only
to your client that you are forwarding to.
<p>good luck
<p>Matteo wrote:
<blockquote TYPE=CITE>&nbsp;<font face="Arial"><font size=-1>Dear,</font></font>
<font face="Arial"><font size=-1>the patch for Kernel is P-O-M ??? so it
is I try install and then I tell you if it work...</font></font> <font face="Arial"><font size=-1>Bye</font></font>
<font face="Arial"><font size=-1>Mat</font></font>
<div style="FONT: 10pt arial">----- Original Message -----</div>
I have the same problem and no time to work on solution.
<br>As far as I know there is a patch for the kernel to add support H.323
into iptables.
<br>As I said I don't have anytime to work on a kernel and iptables configuration
but if you manage to compile and configure H.323 support with IPtables
me&nbsp; and my friends are going to be ver thankful if you post a mail.
<p>good luck
<p>Matteo wrote:
<blockquote TYPE="CITE"><style></style>
<font face="Arial"><font size=-1>Hello,I
have a server linux with redhat 7.3 and shorewall as firewall, now I try
to set protocol H.323 becouse I must receive strem video in multicast that
use H.323....Now infact when I try to connect to Strem video I don't see
anythings when if I try connect my pc directly to modem cable that it support
h.323 strem video work at 100%.Now I want use firewall in front of my pc
and so I must set H.323....</font></font> <font face="Arial"><font size=-1>How
set it ??? how set iptable ?? I must use P-O-M ?? If yes, How I use P-O-M
???</font></font> <font face="Arial"><font size=-1>Thank youMatteo</font></font></blockquote>

<pre>--&nbsp;
+ Emanoil Kotsev - - - - -+
| tel. 0043(1)9253175&nbsp;&nbsp;&nbsp;&nbsp; |
| cel. --------------&nbsp;&nbsp;&nbsp;&nbsp; |
+ E-Mail: emanuel@abc.at&nbsp; +</pre>
&nbsp;</blockquote>

<pre>--&nbsp;
+ Emanoil Kotsev - - - - -+
| tel. 0043(1)9253175&nbsp;&nbsp;&nbsp;&nbsp; |
| cel. --------------&nbsp;&nbsp;&nbsp;&nbsp; |
+ E-Mail: emanuel@abc.at&nbsp; +</pre>
&nbsp;
</body>
</html>

--------------96A09B0E74D69335D519C07F--


