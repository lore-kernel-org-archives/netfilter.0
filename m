From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: active connections
Date: Mon, 3 May 2004 10:19:34 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679314@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

>> thanks
>> but i m a student so i want to caputure the concept also. so please
>> tell me the mystery or tell me about any tutorial about it.

Just an extra step, if you flush your rules and established connections
still work, this could be because you are using SNAT to connec tto the
internet, no?

Conntrack saved entries know how to NAT to and from the source to the
destination because it is stored inside the conntrack table entry.
/proc/net/ip_conntrack is a list of the active sessions.

When you flush the NAT table, any new connections won't NAT properly
because you have removed the rule. Existing connections will already
know how to NAT the connection because its stored elsewhere.

This is the wrong way to deal with dynamic table closures. What you want
is a filter chain that explicitly drops unwanted sessions. Eventually
the sessions will timeout on their own. I haven't used them, but there
are also tools which can generate FIN/RST's on TCP connections which
basically causes a graceful shutdown of the line.


