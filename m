From: Stephen Smoogen <smoogen@lanl.gov>
Subject: Re: Leaky ip_conntrack_ftp in Red Hat kernels
Date: Fri, 12 Dec 2003 12:31:08 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071257468.4890.12.camel@smoogen1.lanl.gov>
References: <1071251376.6079.22.camel@smoogen1.lanl.gov>
	 <20031212115147.58d95778.mgale@utilitran.com>
	 <1071256412.4890.10.camel@smoogen1.lanl.gov>
	 <20031212203143.GB25379@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031212203143.GB25379@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: Michael Gale <mgale@utilitran.com>, netfilter@lists.netfilter.org

On Fri, 2003-12-12 at 13:31, Ramin Dousti wrote:
> On Fri, Dec 12, 2003 at 12:13:32PM -0700, Stephen Smoogen wrote:
> 
> > On Fri, 2003-12-12 at 11:51, Michael Gale wrote:
> > > Hello,
> > > 
> > > 	Why not use another distro ... one that does not all the stable running linux kernel.
> > > 
> > 
> > Well that is always possible within the next 2 years. I do not
> > understand the second part of your sentance.
> 
> And besides I don't think Redhat would customize the ip_conntrack_ftp, meaning
> iff there is a problem it's most probably included in all the distro's using
> that version.
> 

I cant find any RH patch in there code that affects that
ip_conntrack_ftp or ip_conntrack. Now other areas...

> Ramin
-- 
Stephen John Smoogen		smoogen@lanl.gov
Los Alamos National Lab  CCN-5 Sched 5/40  PH: 4-0645
Ta-03 SM-1498 MailStop B255 DP 10S  Los Alamos, NM 87545
-- So shines a good deed in a weary world. = Willy Wonka --


