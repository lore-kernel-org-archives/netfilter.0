From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: new iptables user - default options
Date: Tue, 28 Oct 2003 19:17:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c39d7f$d1bba950$0201000a@sterenborg.info>
References: <FDB52A0429DFD31196FB0008C7D972D50EA578D2@OST_EXCH_USR5>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDB52A0429DFD31196FB0008C7D972D50EA578D2@OST_EXCH_USR5>
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

> In other words putting "accept from anywhere -m --state 
> ESTABLISHED,RELATED" on each of the default chains allows any 
> traffic that's related to an existing permitted connection.  
> Should that be at the top [first rule match wins?] of each table?

Well, only the initial request is handled by each specific rule, the
rest is handled by RELATED,ESTABLISHED.
So yes : I'd put it (almost) on top for performance reasons. You could
however put some filtering rules that you want/need in front of it.


Gr,
Rob


