From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffelist@amagerkollegiet.dk>
Subject: Re: How to stop SPAM from Internal users
Date: Mon, 24 Feb 2003 09:22:23 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0302240916190.1142-100000@grignard.amagerkollegiet.dk>
References: <07c601c2dbd4$5ab5aa80$13fcc5cb@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <07c601c2dbd4$5ab5aa80$13fcc5cb@Housecall>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: hare ram <hareram@sol.net.in>
Cc: netfilter@lists.netfilter.org

On Mon, 24 Feb 2003, hare ram wrote:

> I have One Public IP assigned to eth0
> i have Private network 192.168.1.0/24 connected to eth1
>
> how can stop, some one spamming from internal IP
> i get from lot queries from other host saying that
> my Public IP is spamming .....
>
> 1 ) how do i stop them spaming or relaying mails from internal PC

Setup a local SMTP server. Block port 25 from any host except the mail
server. Thus your local users will need to use your local server.

> 2) how to stop scanning from internal ip to any external IP

You can't unless you want to block internet access entirely. You can
however limit the speed with the 'limit' module - effectively making
scanning impossible.

> 3) how do i kick the user who is infected with the virus and block them a=
nd
> notify to admin

You have to know what IP, they're on and then block all traffic from
that host - and make sure they do not change IP.

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
"Nothing would please me more than being able to hire ten programmers
and deluge the hobby market with good software."
                                                   -- Bill Gates 1976
We are still waiting ....
----------------------------------[ moffe at amagerkollegiet dot dk ] --


