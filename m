From: David Cannings <lists@edeca.net>
Subject: Re: Firewall Script Help
Date: Mon, 8 Mar 2004 18:49:49 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403081849.49587.lists@edeca.net>
References: <JKELJHHMDHPOLKFBOEGHOECGFDAA.cldavis@speakeasy.net>
Reply-To: david@edeca.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <JKELJHHMDHPOLKFBOEGHOECGFDAA.cldavis@speakeasy.net>
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

On Monday 08 March 2004 18:47, Christopher Davis wrote:
> I am trying to block incoming traffic on the INPUT chain
> with reserved ip's.  I am still able to connect to the
> server from a reserved ip.  Below is my entire script if
> someone would like to review and comment -- all coments
> welcome!  This is for a webserver -- port 80 and ssh port 22
> only.  I have not yet included the logging option so those
> options are commented out at this point...

Just a quick point, it is (in my opinion at least) far easier to read your 
firewall rules if they're output from iptables itself.  Following through 
the script is harder.

# iptables -L -v

David

