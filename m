From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Deleting subnet range from conntrack
Date: Tue, 8 Jan 2013 04:50:50 +0100
Message-ID: <20130108035050.GA19114@1984>
References: <026801cded4b$cda64b10$68f2e130$@telsatbb.vu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <026801cded4b$cda64b10$68f2e130$@telsatbb.vu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Steve (Telsat Broadband)" <steve@telsatbb.vu>
Cc: netfilter@vger.kernel.org

Hi Steve,

On Tue, Jan 08, 2013 at 01:56:48PM +1100, Steve (Telsat Broadband) wrote:
> Hi All,
> 
> As part of a walled gateway I have written, the gateway is listening on both
> TCP and UDP for incoming connections.  For TCP, the connection is picked up
> and authenticated and allowed to proceed through the gateway; this all
> appears to work normally; however, under UDP, the unauthenticated data is
> sent to the auth processing listener via a NAT 'REDIRECT' command.  This
> command then authenticates the data, BUT the problem is that UDP data still
> continues to be redirected to the auth processor even after authorisation.
> 
> If have found that if I run a 'conntrack -D -s xxx.xxx.xxx.xxx' on the IP in
> question, the UDP data then flows through as expected.  The problem is, that
> for some instances, I'm needing the authorise/permit a subnet or network
> xxx.xxx.xxx.xxx/xx or and IPv6 subnet and it appears that conntrack doesn't
> support this.
> 
> Is there a way to get around this and delete conntrack entries for the
> subnet?

Unfortunately not yet. But it is doable.
