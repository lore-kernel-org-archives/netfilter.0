From: =?UTF-8?B?TGVvbmFyZG8gUm9kcmlndWVzIE1hZ2FsaMOjZXM=?=
	<leolistas@solutti.com.br>
Subject: Re: tarpit before or after adding chain?
Date: Sun, 18 Dec 2005 03:44:58 -0300
Message-ID: <43A5056A.1090200@solutti.com.br>
References: <43A3ADF3.7050406@comcast.net> <43A3D6BB.4010709@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43A3D6BB.4010709@gmail.com>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: netfilter@lists.netfilter.org



>> I'm a little confused about when to add the TARPIT trap.
>>
>> iptables -N SPECIAL # add special chain for tarpit usage
>>
>> *HERE*?
>> iptables -A SPECIAL -p tcp -j TARPIT
>>
>> #
>> # the following string match rules screen out nimda and other crap
>> #
>> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm=20
>> --string "/default.ida?"     -j SPECIAL
>> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm=20
>> --string ".exe?/c+dir"       -j SPECIAL
>> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm=20
>> --string ".exe?/c+tftp"      -j SPECIAL
>> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm=20
>> --string "cmd.exe"           -j SPECIAL
>> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm=20
>> --string "vti_bin"           -j SPECIAL
>> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm=20
>> --string "nsiislog.dll"      -j SPECIAL
>> iptables -A INPUT -i eth0 -p tcp  --dport 80 -m string --algo bm=20
>> --string "click-network.com" -j SPECIAL
>>
>> *OR HERE?*
>> iptables -A SPECIAL -p tcp -j TARPIT
>>


   Im looking at all these string rules and trying to imagine how your=20
CPU usage will get high, as it seems you have a not-very-low traffic=20
network ......  nobody with a /21 network will have low traffic,=20
specially tcp/80 traffic !!!!

   I havent used string for a while now. In fact i have never used it=20
since I moved to 2.6 kernel. I know it has been ported recently, but I=20
have never used it yet. But I remember ... it's not that long ago ...... =

the 2.4 kernel time ....... all the headaches of CPU usage getting at=20
astronomic levels because of 20-30 string rules on a busy network .....=20
i will never forget that ... :)

   Take it easy with string module, that's my advice ....

--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3=83O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it





