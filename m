From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: H323 in new kernel
Date: 29 Apr 2003 10:26:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051626017.2805.2.camel@jasiiitosh.nexusmgmt.com>
References: <20030429124902.32459.59220.Mailman@kashyyyk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030429124902.32459.59220.Mailman@kashyyyk>
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

I'm running RedHat 8.0 with kernel 2.4.20 and did not see H.323
support.  I did apply the H.323 patch through patch-o-matic to 2.4.20
with no problem and the H.323 patch is working well for me.  If you do
not want to upgrade from RedHat 7.2, you can probably upgrade the kernel
to 2.4.20 and use patch-o-matic.  Good luck - John

On Tue, 2003-04-29 at 08:49, netfilter-request@lists.netfilter.org
wrote:

> --__--__--
> 
> Message: 13
> From: MOUDARIR Mohamed <moudarir@Richbond.ma>
> To: netfilter@lists.netfilter.org
> Subject: H323 in new kernel
> Date: Tue, 29 Apr 2003 10:49:42 -0000
> 
> Hello
> I have redhat 7.2 with iptables 1.2.3
> I don't success to install p-o-m to include H323 module ( support of
> netmeeting session ) , koz compilation problems ...
> So i want to know if H323 is builting ( pre-installed ) in new kernel
> version ( like redhat 8.0 ) so i have not to install p-o-m.
> Thanks
> 
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


