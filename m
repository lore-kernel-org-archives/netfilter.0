From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: physdev match
Date: Wed, 22 Sep 2004 11:58:19 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409221158.19795.gdh@acentral.co.uk>
References: <1403218a04092203537a1bbd0c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a04092203537a1bbd0c@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 22 September 2004 11:53, Mohamed Eldesoky wrote:
> Anyone know a patch for adding the physdev match to 2.4.21 kernels ??
> RHEL3U3.

I have no idea what changes RHEL3 brings to the table, but in the 2.4 series 
no physdev match was required or necessary, because the 'bridge-nf' and later 
'ebtables' patches for 2.4.x. let "-i eth0" and friends work just fine on 
bridged devices, as if they were not bridged.

Cheers,
Gavin.

