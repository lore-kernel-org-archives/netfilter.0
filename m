From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Prevent traceroutes
Date: Fri, 20 May 2005 14:03:47 -0500
Message-ID: <428E3493.4040505@riverviewtech.net>
References: <fad9d484050519150730dbc53d@mail.gmail.com>	<20050519232314.GA9369@bender.817west.com>	<20050519233347.GA9462@bender.817west.com>	<428D8638.4040301@riverviewtech.net>	<428D954E.1010105@riverviewtech.net>	<20050520152021.GA11737@bender.817west.com>
	<Pine.LNX.4.61.0505201443170.8116@e-smith.charlieb.ott.istop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0505201443170.8116@e-smith.charlieb.ott.istop.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Why is filtering in -t mangle not also poor form?

I believe that you are really suppose to do the filtering in the filter table.  But seeing as how the kernel will respond to the traceroute packet that comes in before the rules in the filter table could DROP the packet we have to do this filtering elsewhere to beat the kernel to the punch.  Jason, do you have any additional comments / corrections?



Grant. . . .

