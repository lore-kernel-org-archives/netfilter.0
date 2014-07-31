From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: Re: firewalld and iptables
Date: Thu, 31 Jul 2014 15:54:44 +0200
Message-ID: <53DA4AA4.8030202@conversis.de>
References: <1406813861186.50144@greenberg.pro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1406813861186.50144@greenberg.pro>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Paul Greenberg <paul@greenberg.pro>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 31.07.2014 15:37, Paul Greenberg wrote:
> Hi,
> 
> I installed CentOS 7 a few days ago. It seems that iptables commands are still working.  For example, I can still execute:
> $ iptables-restore iptables.rules
> However, I am unable to permanently store the rules. 
> 
> CentOS has a new deamon, called firewalld, with firewalld.conf file. Does any one know how how to force the rules in iptables-save to be permanently saved by firewalld daemon?

You cannot use manual iptables and firewalld together. If you want to
use naked iptables you have to disable the firewalld service completely
and probably install the iptables-service package.

Regards,
  Dennis

