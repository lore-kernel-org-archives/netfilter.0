From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: common FTP+NAT problem
Date: Mon, 31 Jul 2006 19:23:15 +0200
Message-ID: <ade2e91fad1d3aa9fd2a7f7386e7585c@former03.de>
References: <44CE313A.4040204@ort.edu.uy>
	<5801cedd6a9e2c3fb5137903c6ba8c73@former03.de>
	<44CE397B.9030404@ort.edu.uy>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CE397B.9030404@ort.edu.uy>
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
To: Ernesto Silva <silva@ort.edu.uy>
Cc: netfilter@lists.netfilter.org

Hi Ernesto,

> Sorry, it was a typo, _nat is defined as "iptables -t nat -A=20
> POSTROUTING" so thats not the problem.
>
> I was not clear enough, I don't have an ftp server, I just want to=20
> access internet ftp servers from my internal network which is=20
> protected by the firewall. The firewall itself don't have any other=20
> running service but iptables.

sorry, I probably didn't read your mail well enough.
You need some other rule for the data connection then, I assume it=20
should look like this, but it's a long time ago I needed that for the=20
last time:

Active mode (server initiates a client connection)
$_fwd -i $INET_IF -o $INT_IF -p tcp --sport 20 --dport ! 0:1023 -m=20
state --state NEW,ESTABLISHED,RELATED -j ACCEPT
(which is probably what you've tried, but you used port 21 instead of=20
20 whicht is the ftp-data port)
Passive mode (client initiates connection
$_fwd -i $INT_IF -o $INET_IF -p tcp --sport ! 0:1023 --dport 20 -m=20
state --state NEW,ESTABLISHED,RELATED -j ACCEPT

(For details about how the connection process for FTP works, just=20
google for "ftp active passive mode", for example this looked quite=20
clear to me: http://slacksite.com/other/ftp.html)

I assume the ftp conntrack will automatically handle the nat, but I'm=20
not 100% sure, so perhaps try to monitor that using tcpdump or wait for=20=

another answer from the list ;-)

Hope it works,

-- Baltasar

Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


