From: Damjan <gdamjan@mail.net.mk>
Subject: Re: Sharing ip_conntrack ?
Date: Tue, 23 Dec 2003 15:01:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031223140129.GB31178@legolas.on.net.mk>
References: <20031222211914.313f10b8.michael@bluesuperman.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031222211914.313f10b8.michael@bluesuperman.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> What I want to know if anyone has any idea how to keep the state on the
> second box so NO connections will be lost if a fail over occurs.

There's a patch in pom, that will enable ip_conntrack to pick up already
established connections.


-- 
Damjan Georgievski
jabberID: damjan@bagra.net.mk

