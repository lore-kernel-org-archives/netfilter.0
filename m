From: Vincent Lim <vincent.lim@nestac.com>
Subject: Re: ip_conntrack_ftp problem
Date: 28 Mar 2003 18:19:07 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048846747.1476.57.camel@vincentlim>
References: <3E83FC78.7080801@ms.sapientia.ro>
	 <1048840079.1236.45.camel@vincentlim>  <3E841938.3050708@ms.sapientia.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E841938.3050708@ms.sapientia.ro>
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
To: Budai Laszlo <lbudai@ms.sapientia.ro>
Cc: netfilter <netfilter@lists.netfilter.org>

On Fri, 2003-03-28 at 17:43, Budai Laszlo wrote:
> Thanks, this solved  my problem. However, if you check my first post you 
> can see thet in the FORWARD chain I had :
> 
> ACCEPT     all  --  anywhere             anywhere           state RELATED
> 
> but seems it was not enough ... :(  and I don't  understand. isn't your 
> rule more restrictiv (state RELATED, ESTABILISHED) than my old rule 
> (just related)?

RELATED is for the ftp-data connection that is established after initial
connection attempt.
ESTABLISHED is for the original replies, which I think the server would
first used until a second/other connection is negotiated.

My $0.02

-- 
Vincent Lim <vincent.lim@nestac.com>
NESTAC Solution Sdn Bhd


