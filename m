From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Firewall Script Help
Date: Mon, 8 Mar 2004 20:34:16 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403090434.i294YHfG021288@server5.bandwidthco.com>
References: <200403081849.49587.lists@edeca.net>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403081849.49587.lists@edeca.net>
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
To: david@edeca.net, netfilter@lists.netfilter.org

As David said "Opinion".  Not all of us believe that to be the case. 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of David Cannings
Sent: Monday, March 08, 2004 10:50 AM
To: netfilter@lists.netfilter.org
Subject: Re: Firewall Script Help

On Monday 08 March 2004 18:47, Christopher Davis wrote:
> I am trying to block incoming traffic on the INPUT chain with reserved 
> ip's.  I am still able to connect to the server from a reserved ip.  
> Below is my entire script if someone would like to review and comment 
> -- all coments welcome!  This is for a webserver -- port 80 and ssh 
> port 22 only.  I have not yet included the logging option so those 
> options are commented out at this point...

Just a quick point, it is (in my opinion at least) far easier to read your
firewall rules if they're output from iptables itself.  Following through
the script is harder.

# iptables -L -v

David



