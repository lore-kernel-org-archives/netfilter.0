From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Can IPTABLES be used to send alerts!
Date: Wed, 27 Aug 2003 09:43:24 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308270926070.7868@simba.math.ucla.edu>
References: <88116A11E9DFD411870900508BEC3831803C8B@CPQ01>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <88116A11E9DFD411870900508BEC3831803C8B@CPQ01>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Deshwal Chand <CDD@kampsax.co.in>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

On Wed, 27 Aug 2003, Deshwal Chand wrote:
> I am using IPTABLES and Squid. I want to monitor all the traffic going out
> of this box. Suppose someone sends his/her CV from our network using his/her
> Yahoo or Hotmail account, then I may get an alert.

Another person pointed out that you could make a copy of your datastream,
using iptables facilities, and feed it to a program that you write, which
would do the analysis.  But actually analysing the data would be very hard,
since you would have to understand meaning and intent, not just trigger on
text strings.

In American custom and law, monitoring users' content is not proper
behavior.  At UCLA there is a specific regulation that would forbid it at
my site.  Commercial web hosts such as msn.com have rules forbidding
pornographic, defamatory, illegal, etc. postings, but in the USA the custom
is that the host has to wait until someone claims to have been harmed by
the posting, before taking action.  A few years ago, aol.com got proactive
about editing postings that criticized AOL, and they were severely flamed
for it.

I don't know the situation in Indian and British law, but you should
definitely consult a lawyer, as well as a spiritual advisor who can give
you guidance in proper behavior according to Indian custom, before
snooping on users to detect people trying to get a better job elsewhere.
If I were interviewing a new programmer and he/she said he left his
previous job because the employer was snooping on him, I would consider
that a sufficient reason to leave the job.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

