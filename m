From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Use IP connection tracking only for input and output chains
Date: Thu, 11 Aug 2005 12:04:46 -0500
Message-ID: <200508111204.46111.rob0@gmx.co.uk>
References: <B9833546B2643B43A56C4E962E13174602A989@nehemiah.joris2k.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B9833546B2643B43A56C4E962E13174602A989@nehemiah.joris2k.local>
Content-Disposition: inline
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

On Thursday 2005-August-11 06:45, Joris Dobbelsteen wrote:
> I've a question whether it is a supported configuration where the
> connection tracking module is solely used for traffic local to the

I believe the "raw" table can be used to bypass connection tracking. I 
don't know whether or not that is available in OpenWRT.

Do you like OpenWRT? I have Sveasoft on mine but I am not comfortable 
with it because of the GPL violations and the comments I have seen 
about the Sveasoft maintainer. It's nice to have Linksys-style GUI 
control, but I am quite capable of CLI management too.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

