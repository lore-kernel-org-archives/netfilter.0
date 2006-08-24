From: Matt Singerman <msingerman@ncemch.org>
Subject: Re: Problems configuring iptables
Date: Thu, 24 Aug 2006 11:08:58 -0400
Message-ID: <44EDC10A.40002@ncemch.org>
References: <580B00011E6B2F4980CAC67A08FECC3AF765CE@rpo.oldplacerville.csvaluation.lan>	<44EC95B0.1090808@ncemch.org>	<44EC966C.6000002@ncemch.org>
	<44EC9CE0.10308@rtij.nl>	<44ECA54A.2000905@ncemch.org>
	<44ECA9FE.30605@rtij.nl> <44ED862A.7020603@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44ED862A.7020603@freemail.hu>
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
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@lists.netfilter.org



G=E1sp=E1r Lajos wrote:
> Martijn Lievaart =EDrta:
>> Matt Singerman wrote:
>>
>>> This did work, yes!  Thanks!  I am experiencing a new problem,=20
>>> though: it took an extremely long time for the connection to go=20
>>> through.  Once it connected, it runs at normal speed, but it took a=20
>>> good 30 or 40 seconds for ssh to prompt me for my password.  What=20
>>> could be causing this?  I am guessing it is some sort of routing issu=
e?
>>>
>> Ah no. It's either reverse DNS or ident that trips you up. Ethereal=20
>> is your friend, look what goes on "at the wire".
>>
>> M4
>>
>>
>>
> I am not sure... but maybe your script blocks the DNS service...
> Try it on your firewalled server and on a client behind the firewall...
> (host www.netfilter.org  AND   nslookup www.netfilter.org)

So I think the problem was that traffic was not able to flow back out=20
over the connection from within the firewall.  I set up a ne rule=20
allowing all packets from the internal NIC to head out over the external=20
NIC, regardless of type or state, and that cleared up the problem=20
instantly.  Thanks again for all the help, everyone!

