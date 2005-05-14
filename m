From: =?ISO-8859-2?Q?=A3ukasz_Hejnak?= <sziftgroup@wp.pl>
Subject: Re: SSH Brute force attacks
Date: Sat, 14 May 2005 11:08:38 +0200
Message-ID: <4285C016.2060900@wp.pl>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>
	<42824D1E.7040508@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42824D1E.7040508@riverviewtech.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Taylor, Grant wrote:
>> Thanks to Grant for the info above, but for some funny reason I cant=20
>> get the following to work
>>
>> iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds=20
>> 60 -m recent --hitcount 4 --set --name SSH -j RETURN
>>
>> this what I get back:
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> [root@abc root]# iptables -A SSH_Brute_Force -m recent --name SSH !=20
>> --rcheck --seconds 60 -m recent --hitcount 4 --set --name SSH -j RETURN
>> iptables v1.2.9: Unknown arg `4'
>> Try `iptables -h' or 'iptables --help' for more information.
>> [root@ns root]#
> I'm betting that you don't have the "recent" match extension compiled in =

> to the kernel directly or as a module.  Try "iptables -m recent -h" to=20
> see if you get any output talking about recent at the bottom or if it=20
> complains.  I don't think that the recent extension is in the base=20
> kernel and thus you will have to apply some patches via p-o-m to the=20
> kernel and iptables and recompile your self.  Once you have support for=20
> the recent match extension you should be able to do what I have=20
> suggested.  If you need help just ask.

Hi
I just thought I'll join in, cause I have a similar problem, but the=20
rest of this discussion doesn't solve it.
Like in above I have
#iptables -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds=20
60 -m recent --hitcount 4 --set --name SSH -j RETURN
iptables v1.3.1: Unknown arg `4'
Try `iptables -h' or 'iptables --help' for more information.

and the iptables -m recent --help gives

#iptables -m recent --help
iptables v1.3.1

Usage: iptables -[AD] chain rule-specification [options]
        iptables -[RI] chain rulenum rule-specification [options]
<cut here>
[!] --version   -V              print package version.

recent v1.3.1 options:
[!] --set                       Add source address to list, always matches.
[!] --rcheck                    Match if source address in list.
<cut again>
     --rdest                     Match/Save the destination address of=20
each packet in the recent list table.
ipt_recent v0.3.1: Stephen Frost <sfrost@snowman.net>.=20
http://snowman.net/projects/ipt_recent/


I have the 'recent match' compiled into the kernel as a module
and I had recompiled the kernel and then the iptables, and still the=20
above apears when executing.
Any ideas to what can be wrong here?
I'm on a HLFS system (april svn) and my kernel is now 2.6.11.9-grsec,
as I updated it to see if it's related to the problem.
The iptables I use was downloaded yesterday via svn

Also I understand that a `iptables -N SSH_Brute_Force` is mutedly=20
assumed? or maybe I'm missing something bigger here?

--
With regards
=A3ukasz Hejnak

