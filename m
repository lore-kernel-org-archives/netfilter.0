From: "Bewerbungsadresse@web.de" <bewerbungsadresse@web.de>
Subject: IP-Range and Subnetmask
Date: Wed, 05 Nov 2003 22:20:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FA969BA.3090908@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

hi

i=B4ve a simple question

is it possible to prevent spoofing attacks to 172.16.0.0-172.31.255.255=20
on the external internet IP in one rule?

something like that

iptables -A INPUT -p tcp -s 172.16.0.0/255.31.0.0 -d $INET_IP -i ppp0 -j=20
SPOOFED

???

but i think the rule above is wrong
so: is it possible at all?
or do i have to write a loop or all single ip-ranges manually?

thx
greez


