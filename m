From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: smtp
Date: Fri, 14 May 2004 16:53:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405141653.13263.gdh@acentral.co.uk>
References: <BAY15-F11qrwMfNORuP0005ce41@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F11qrwMfNORuP0005ce41@hotmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Friday 14 May 2004 16:41, azeem ahmad wrote:
> hi
> sorry for disturbing you a lot
> but i dont know how can i capture the screen. should i write it down

That's OK there are a couple of easy alternatives. Either 'ssh' into the 
machine (google for 'putty' - a good SSH client for windows) and copy and 
paste the output.. or redirect the output from tcpdump to a file, the same 
way you can with any UNIX command...

$ tcpdump -n -i eth1 port 25 >dump.txt

Then you can just insert this text file into the body of your email.

Cheers,
Gavin.

