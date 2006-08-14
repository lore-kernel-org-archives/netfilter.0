From: "Siqhamo Sifo" <siqhamo@newlunar.co.za>
Subject: Sip Connection Tracking
Date: Mon, 14 Aug 2006 11:56:46 +0200 (SAST)
Message-ID: <44179.10.0.0.1.1155549406.squirrel@10.0.0.1>
Reply-To: siqhamo@newlunar.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I recently recompiled my kernel with Sip support and now I have a problem
with
ip_nat_sip and ip_conntrack_sip.They do not seem to be working , see I do
port
forwarding to my asterisk box behind the NAT and I can connect
successfully from outside using xlite.The problem is that I do not get an=
y
audio , reason being that when I take a look at  the packets which r
coming from my asterisk box thorough the nat I find that I the SIP header=
s
under the SDP section the connection address still refers to my asterisk
box behind the NAT and hence the RTP packets r sent to my 10.* ip which
does not make sense .

Siqhamo


