From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: iptables with multiport problem
Date: Tue, 5 Oct 2004 09:29:50 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF567954A@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: tedkaz@optonline.net, bruce <bruce@gajshield.com>
Cc: netfilter@lists.netfilter.org

Ted Kaczmarek wrote:
> On Tue, 2004-10-05 at 18:17 +0530, bruce wrote:
>> Hi all,
>>=20
>> I am  working with linux firewall implementation
>>=20
>>=20
>> I am using iptables version  v1.2.11 and  linux kernal 2.4.27.
>> If multiport option comes with iptables(iptable rules are below), the
>> services are not working. But individual services are working
>> properly.=20
>> The following filtering rules are not giving any syntatical errors.
>> I checked logs no info..
>>=20
>> #/sbin/iptables -A FORWARD -i eth0 -o eth1 -p tcp -s 192.168.2.0/24
>> -m multiport --dport 24,80 -m multiport --sport 0:65535  -d
>> 192.168.1.2  -j ACCEPT=20
>>=20
>> #/sbin/iptables -A FORWARD -i eth1 -o eth0 -p tcp -s 192.168.1.2 -m
>> multiport --sport 24,80 -d 192.168.2.0/24 -m multiport --dport
>> 0:65535 -j ACCEPT=20
>>=20
>> Please give any solution or hints for the below problem.
>> Thanks
>> Bruce
>>=20
> I kind of remember multiport support coming via a patch.
> Also your 0:65535 is not multiport.

Well, 0:65535 is a valid range, but it'll always return true, so leaving
it out amounts to the same thing. Your real problem is that you call
multiport twice and the fact that you use dport instead of dports and
sport instead of sports which the multiport patch requires. If in doubt
of the command syntax, type iptables -m <module> --help or iptables -j
<target> --help from the command line.


