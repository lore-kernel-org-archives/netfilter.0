From: Christian Cernuschi <christian@cernuschi.com>
Subject: Redirection - considerations
Date: Wed, 9 Apr 2003 13:05:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304091305.45463.christian@cernuschi.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

it think it's impossible! (keeping the source address... of course)

an example

A - Client starting connection
B - Server reached by A
C - Destination Server



A calls B
B sends packets to C with source address A
C tries to respond to A!!!=20
A doesn't know C (then drops packet)

am i right?

