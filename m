From: Craig Davison <cd@securityfocus.com>
Subject: Re: Blocking downloads
Date: Wed, 5 Feb 2003 11:16:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030205181604.GA25714@securityfocus.com>
References: <D007132BBC42D5118FD20002A52844414BCF58@ASC01>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <D007132BBC42D5118FD20002A52844414BCF58@ASC01>
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
To: ASC - Ronald Roeleveld <r.roeleveld@ascinternational.nl>
Cc: netfilter@lists.netfilter.org

On Wed, Feb 05, 2003 at 05:01:43PM +0100, ASC - Ronald Roeleveld wrote:
> What I want is that clients cannot, let's say with Internet Explorer or
> Mozzila, download files from the internet, but can browse the internet.

Use a web proxy like Squid to block certain Content-types.
You could limit users to text/plain, text/html and image/*.

I think the configuration directive you want is req_mime_type, but I could 
be wrong:
http://squid.visolve.com/squid24s1/access_controls.htm

-- 
Craig Davison
Symantec Corporation
+1 (403) 213-3939 ext. 228

