From: Jason Opperisano <opie@817west.com>
Subject: Re: ip + mac authentication
Date: Wed, 19 Jan 2005 09:44:00 -0500
Message-ID: <1106145840.4934.35.camel@hubcap.ljm.dom>
References: <20050119103603.82231.qmail@web30810.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050119103603.82231.qmail@web30810.mail.mud.yahoo.com>
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

On Wed, 2005-01-19 at 05:36, Linux Query wrote:
> Hi all!
> 
> I want to ensure that each of my clients can have
> access to the net only with the ip address which is
> specifically assigned to him / her. Is the following
> going to work ?
> 
> iptables -I FORWARD -o externalinterface -s
> xx.xx.xx.xx -m mac --mac-source yy:yy:yy:yy:yy -j
> ACCEPT
> 
> or is it required to be done in some other way ?

looks good to me.  you may want to specify "-i $INTERNAL_INTERFACE" as
well, but that's just me.

-j

--
"It is better to remain silent and thought a fool, than open your
 mouth and remove all doubt."
	--The Simpsons


