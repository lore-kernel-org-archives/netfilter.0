From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: secure ftp with SSL
Date: Fri, 13 Sep 2002 10:43:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209131043.52555.roy@karlsbakk.net>
References: <754E53EEA7D3D31194E50050DAB99F6E70543C@thor.id.magnus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <754E53EEA7D3D31194E50050DAB99F6E70543C@thor.id.magnus.com>
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
To: Rendy V <RendyV@atd.magnus.co.id>, "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

On Friday 13 September 2002 05:09, Rendy V wrote:
> Hi All,
> I have a strange problem, the problem is like this :
> I have an application that use secure ftp and for that reason I have op=
ened
> up the command port (990) with state NEW and allowed data port
> (20000:20049) with state ESTABLISHED, RELATED on the firewall. It fails
> when it try to use data port, for authentication it working just fine.
> Please see the log on the below.
> If I open data port 2000:20049 with state NEW it working normally but I
> don't want to make a big hole on my firewall. I suspect that the iptabl=
es
> connection tracking cannot track the relation between command port and =
data
> port because it is encrypted using SSL. Is it true or is there somethin=
g I
> miss here?? What should I do now??

first - have you loaded ip_conntrack_ftp?=20

second - I'm not sure the ip_conntrack_ftp module can understand encrypte=
d=20
traffic. Try using sftp from openssh instead. That only uses 22/tcp.

roy

--=20
Roy Sigurd Karlsbakk, Datavaktmester
ProntoTV AS - http://www.pronto.tv/
Tel: +47 9801 3356

Computers are like air conditioners.
They stop working when you open Windows.


