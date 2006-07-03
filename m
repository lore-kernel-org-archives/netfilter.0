From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: private to public IP
Date: Mon, 3 Jul 2006 13:17:03 +0200 (CEST)
Message-ID: <57177.193.173.147.3.1151925423.squirrel@webmail.sterenborg.info>
References: <006801c69dcb$9fccd140$7819a8c0@MYNOTEBOOK>
	<1151856182.5609.2.camel@robee.mars.cyberbajt.pl>
	<004b01c69e8d$5f083ab0$7819a8c0@MYNOTEBOOK>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004b01c69e8d$5f083ab0$7819a8c0@MYNOTEBOOK>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, July 3, 2006 12:42, Wennie V. Lagmay wrote:
> Hi Robee,
>
>
> Thank you very much for your reply, just want to confirn something.
>
>
> 1. Based on the script  you've sent to me does it mean that I have to i=
nput
> all my private subnets example
> iptables -I  FORWARD  -s 192.168.1.0/24 -m state --state NEW -j LOG
> --log-level info
> iptables -I  FORWARD  -s 192.168.2.0/24 -m state --state NEW -j LOG
> --log-level info
> iptables -I  FORWARD  -s 192.168.3.0/24 -m state --state NEW -j LOG
> --log-level info
> iptables -I  FORWARD  -s 192.168.4.0/24 -m state --state NEW -j LOG
> --log-level info
> and so on

Yes. But you can script that to save yourself some work if you have a lot=
 or
these.
You do know that when you are using "-I" that you are inserting the rules=
 on
top of each other, instead of appending them..? In this case it doesn't m=
atter
but you may get unexpected results if you are not aware of it.

> 2. With this script I can  identify a certain Private IP, which public =
IP
> address it use and which remote IP it is connected? example
>
> Private IP =3D 192.168.2.56
> Public IP =3D  203.174.11.8
> Remote IP =3D 65.67.87.9 (www.yahoo.com)

No. Only the source (private) IP and the remote (destination) IP (and mor=
e,
like [s|d]port, etc). A logging line would look something like this:

Jul  3 12:55:35 fw INPUT:  IN=3Deth0 OUT=3D
MAC=3D00:a0:27:a0:6b:00:00:b0:d0:db:aa:3a:08:00  SRC=3D60.11.125.36 DST=3D=
1.2.3.4
LEN=3D485 TOS=3D00 PREC=3D0x00 TTL=3D40 ID=3D0 DF PROTO=3DUDP SPT=3D40867=
 DPT=3D1026 LEN=3D465

Jul  3 12:55:35 fw INPUT:  IN=3Deth0 OUT=3D
MAC=3D00:a0:27:a0:6b:00:00:b0:d0:db:aa:3a:08:00  SRC=3D60.11.125.36 DST=3D=
1.2.3.4
LEN=3D485 TOS=3D00 PREC=3D0x00 TTL=3D40 ID=3D0 DF PROTO=3DUDP SPT=3D40867=
 DPT=3D1027 LEN=3D465

(This is a DROP rule in the INPUT chain so there's no private source IP.)

> 3. Are all the log are stored in /var/log/messages?

That depends on your syslog config. Normally, I think: yes.
If you want to log more specific, you can setup ulogd and use the ULOG ta=
rget.


Gr,
Rob



