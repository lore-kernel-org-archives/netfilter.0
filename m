From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Poll on large sites that deploy Iptables.
Date: Wed, 02 Jun 2004 18:45:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086216341.8437.3.camel@localhost>
References: <s0bdf828.051@GroupWise>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <s0bdf828.051@GroupWise>
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
To: Brett Simpson <Simpsonb@hillsboroughcounty.org>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-06-02 at 15:54, Brett Simpson wrote:
> We are a large organization, 3000 plus users, considering switching from Checkpoint FW1 to Iptables. I was wondering how many large organizations (1000 plus users) are using Iptables in a production environment?
> 
> For those that are using Iptables and were previously using a commercial product what were your reasons for switching and what issues have you seen using Iptables?
> 
> Thanks,
> Brett
I do not have any massive deployments yet but the ISCS project
(http://iscs.sourceforge.net) is initially based upon iptables as the
firewall and is targeted to large enterprise and carrier networks. 
We've not yet had the opportunity to stress it.  We have placed iptables
based firewalls on some client sites that are smaller than yours but
very avid web users (large, international PR firm) and we've not had
them break a sweat.  They have never gone down.  I'm looking forward to
both the other responses and the day when I can say we have ISCS
deployments numbering thousands of gateways and many tens of thousands
of users - John
-- 
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevelopmentcorp.com


