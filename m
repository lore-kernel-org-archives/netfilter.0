From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: snmptraps incomming on udp port 162 REDIRECT to 4162 not working?
Date: Tue, 5 Nov 2002 12:43:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211051243.11962.netfilter@newkirk.us>
References: <1036512998.8715.44.camel@ben.mis.tnsi.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036512998.8715.44.camel@ben.mis.tnsi.com>
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
To: Ben Russo <ben@umialumni.com>, netfilter@lists.netfilter.org

On Tuesday 05 November 2002 11:16 am, Ben Russo wrote:
>
> I tried the following:
>
> iptables -t nat -p udp -m udp --dport 162 -j REDIRECT --to-ports 4162

iptables -t nat -A PREROUTING -p udp --dport 162 -j REDIRECT --to-ports 4=
162

should redirect all incoming for port 162 to port 4162.  You needed to sp=
ecify=20
what chain in the nat table (IE, PREROUTING to catch them as they first h=
it=20
the firewall).  If it still fails then make sure you are allowing packets=
 for=20
port 4162 through the INPUT chain of the filter table, since that's where=
=20
they should pass, and the dport they should indicate.

j

