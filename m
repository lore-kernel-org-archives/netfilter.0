From: Dhananjoy Chowdhury <dhananjoy@nucleussoftware.com>
Subject: Re: A simple question
Date: Thu, 19 Aug 2004 10:22:31 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1092891151.4954.57.camel@dc>
References: <41241244.40804@svw.com>
Reply-To: dhananjoy@nucleussoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41241244.40804@svw.com>
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
To: Sudheer Divakaran <sudheer@svw.com>
Cc: Netfilter mailing list <netfilter@lists.netfilter.org>

Hi,
As far as my knowledge this is done so that the local processes on the
firewall machine itself cannot communicate with the outside world.
Mostly firewalls are set for FORWARDing so from security point of view
its better we set the OUTPUT chain to DROP.
But its again your choice waht you want to ACCEPT or DROP.


On Thu, 2004-08-19 at 08:06, Sudheer Divakaran wrote:
> Hi,
> 
> In almost all IP Tables articles I've found that the default policy of 
> all tables (INPUT,OUTPUT,FORWARD) set to DROP.  I can understand it as 
> far as INPUT and FORWARD tables are concerned, but I do not understand 
> why should we set the default policy of OUTPUT chain to DROP.  OUTPUT 
> chain is responsible for packets originating from the firewall itself.  
> Whay should we DROP it?
> 
> Thanks,
> Sudheer
> 


