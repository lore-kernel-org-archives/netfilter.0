From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: How to log dropped packet ?
Date: Wed, 16 Jul 2003 10:10:31 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030716141031.GB27608@cannon.eng.us.uu.net>
References: <000701c34b93$c4da9180$96f2f8db@independence.co.kr> <1058359786.6618.33.camel@raylinux.internal> <20030716131925.M66225@tripnotik.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030716131925.M66225@tripnotik.dyndns.org>
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
To: Julien Didron <admin@tripnotik.dyndns.org>
Cc: netfilter@lists.netfilter.org

man syslog.conf
man syslogd
also -j LOG --log-level info/alert/debug...


On Wed, Jul 16, 2003 at 01:22:19PM +0000, Julien Didron wrote:

> Hi all,
> 
> I apologize for being a little OT, but has anybody tried to log to another 
> file than /var/log/syslog when using -j log ? if so, thanks for sharing the 
> experience ;o)

