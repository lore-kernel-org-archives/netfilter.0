From: Bjorn Ruberg <bjorn@ruberg.no>
Subject: Re: controlling access based on IP address
Date: 23 Feb 2003 13:19:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046002753.11190.27.camel@mikke>
References: <Pine.LNX.4.44.0302210658090.5274-100000@ns1.teamraf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0302210658090.5274-100000@ns1.teamraf.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Fri, 2003-02-21 at 13:59, q@ns1.teamraf.com wrote:
> I've been browsing around looking for this answer...

Not very much it seems. The netfilter documentation is here:
http://www.netfilter.org/documentation/

> Is it possible to allow an IP address through netfilter for a specific=20
> service, say ssh(22).

Yes. Use the --dport parameter, e.g.
iptables -A FORWARD -s your.home.ip.address -p tcp --dport 22 -j ACCEPT


Bj=F8rn


