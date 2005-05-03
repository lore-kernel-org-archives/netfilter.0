From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: rules for skype
Date: Tue, 03 May 2005 03:50:57 -0400
Message-ID: <1115106657.14622.62.camel@jasiiitosh.nexusmgmt.com>
References: <20050502150901.DAEF39E9F4@dd6816.kasserver.com>
	<42764919.60507@lopsch.com><42764E36.7080300@riverviewtech.net>
	<BAY107-DAV7808D3CABD608123BCF2CB7270@phx.gbl>
	<002401c54fb0$33cdc950$2604a8c0@ndchunk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002401c54fb0$33cdc950$2604a8c0@ndchunk>
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
To: Victor Yeo <yeosv@ndc.com.tw>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Tue, 2005-05-03 at 15:17 +0800, Victor Yeo wrote:
> > - Use *tc* to choke the skype traffic. I have a list of apps to allow
> > through the network. The rest go into a default pipe of 2 Kbps. This
> > deteriorates the performance of the application. I think text chatting
> will
> > still go through but voice chatting, file sharing and all gets choked.
> > NOTE: I have had better success not blocking its default ports. That way I
> > can keep it away from the standard Internet ports and thus easily classify
> > it into the default pipe.
> 
> Where can i find more information on *tc* ? thanks for any reply.
> 
> Rgds,
> Victor
> 
<snip>
You can try 'man tc' and take a look at
http://lartc.org/howto/index.html

Good luck - John

-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


