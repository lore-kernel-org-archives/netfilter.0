From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: How to make a computer invisible
Date: Tue, 02 Dec 2003 13:09:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070388543.2057.23.camel@grendel>
References: <000501c3b88e$65e35550$6400a8c0@deamon>
	 <20031202081427.58d57208.mgale@utilitran.com>
	 <1070380086.2057.17.camel@grendel>
	 <20031202090120.65abc625.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031202090120.65abc625.mgale@utilitran.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Tue, 2003-12-02 at 11:01, Michael Gale wrote:
> Do you have rate limit on this rule

Yup, 3/sec. Combine this with the high TTL used by Netfilter and your
firewall looks more like a Cisco router than a Linux based firewall.

C



