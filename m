From: Michael Stilmant <ml-netfilter@adtech.be>
Subject: RE: transparent tcp proxy
Date: 27 May 2003 11:49:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054028975.18150.65.camel@stilmant>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019241@wardrive.citadelcomputer.com.au>
	 <1053938722.17259.6.camel@stilmant>
	 <1054024461.694.31.camel@elendil.intranet.cartel-securite.net>
Reply-To: ml-netfilter@adtech.be
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054024461.694.31.camel@elendil.intranet.cartel-securite.net>
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

On Tue, 2003-05-27 at 10:34, Cedric Blancher wrote:
> What about a layer 2 SNAT on OUTPUT chain from B to A for filtered
> packets ?
> ebtables can achieve this.

Well, I'll look in this solution. Thanks ...  so you say it's possible
to make a filter in ebtables where I can say for all frame for ip:A port
X from port Y replace MAC with the #C value ?

Michael


