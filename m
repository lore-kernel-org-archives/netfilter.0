From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: Re: Filtering in POSTROUTING
Date: Fri, 14 Jun 2002 01:22:07 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0206140121530.8350-100000@grignard.amagerkollegiet.dk>
References: <5.0.2.1.2.20020529151609.00a54b28@mail.SoftHome.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <5.0.2.1.2.20020529151609.00a54b28@mail.SoftHome.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Blesson Paul <blessonpaul@softhome.net>
Cc: netfilter@lists.samba.org

On Wed, 29 May 2002, Blesson Paul wrote:

> Hi all
> =09=09=09I am trying to use iptables as  firewall. Now I want to filter t=
he
> packets which are Masqueraded. In one of the tutorial, there is written
> that filtering is not done in POSTROUTING chain since certain packets wil=
l
> bypass the chain. Then where to filter the network traffic from internal
> network to outside

-t filter -A FORWARD

/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] --------------------------------------=
-
Remember, there are no stupid questions
- just stupid people.
             - Mr. Garrison, South Park
----------------------------------[ moffe at amagerkollegiet dot dk ] --


