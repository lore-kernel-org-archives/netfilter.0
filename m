From: Jason Opperisano <opie@817west.com>
Subject: Re: Problem with APT-GET (ftp) and iptables
Date: Thu, 23 Dec 2004 13:33:08 -0500
Message-ID: <1103826788.6478.90.camel@hubcap.ljm.dom>
References: <9ea1c1180412230959363e647c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9ea1c1180412230959363e647c@mail.gmail.com>
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

On Thu, 2004-12-23 at 12:59, Noah Slater wrote:
> Hello,
> 
> I have a question regarding iptables and apt-get. I have a shell
> script which is included at the bottom of this email which sets up
> iptables for me. The only problem is that it is not managing to track
> apt-get's ftp connections and prevents me from using it. I have
> included a tail of /var/log/messages and the output when I try to run
> apt-get.
> 
> It seems to be failing to let ftp connections back into my box.
> 
> I would be more than appreciative if someone could point out where I
> am going wrong.

it appears as though you don't have "ip_conntrack_ftp" loaded;
therefore, there's nothing to recognize that the SYN from the FTP server
is RELATED.

-j

--
"That's it! You people have stood in my way long enough. I'm going
 to clown college!"
	--The Simpsons


