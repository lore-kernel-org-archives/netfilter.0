From: James Morris <jmorris@intercode.com.au>
Subject: Re: IPQ Initialization
Date: Thu, 13 Feb 2003 15:30:47 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0302131530340.3719-100000@blackbird.intercode.com.au>
References: <3E4ADBDA.7030804@qwest.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E4ADBDA.7030804@qwest.net>
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
To: Sapient2003 <sapient@qwest.net>
Cc: netfilter <netfilter@lists.netfilter.org>

On Wed, 12 Feb 2003, Sapient2003 wrote:

> Could not initialize IPQ: Failed to send netlink message: Connection refused
> 
> What would cause this error? I just got done getting the IPQ libraries 
> installed using make install-devel, and I cannot use them because of the 
> above error.

The ip_queue module is not loaded.

-- 
James Morris
<jmorris@intercode.com.au>



