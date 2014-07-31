From: Paul Greenberg <paul@greenberg.pro>
Subject: RE: firewalld and iptables
Date: Thu, 31 Jul 2014 14:12:43 +0000
Message-ID: <1406815954123.1965@greenberg.pro>
References: <1406813861186.50144@greenberg.pro>,<53DA4AA4.8030202@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <53DA4AA4.8030202@conversis.de>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thank you Denis.

In case someone needs this:
  systemctl status iptables
  systemctl stop firewalld
  yum -y install iptables-services
  systemctl enable iptables
  systemctl start iptables

________________________________________
From: netfilter-owner@vger.kernel.org <netfilter-owner@vger.kernel.org> on behalf of Dennis Jacobfeuerborn <dennisml@conversis.de>
Sent: Thursday, July 31, 2014 9:54 AM
To: Paul Greenberg; netfilter@vger.kernel.org
Subject: Re: firewalld and iptables

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

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
