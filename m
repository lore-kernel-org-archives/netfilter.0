From: KOVACS Krisztian <hidden@sch.bme.hu>
Subject: Re: Iptables complains about kernel after filesystem damage
Date: Tue, 2 Oct 2007 13:08:55 +0200
Message-ID: <20071002110854.GA31713@sch.bme.hu>
References: <000201c804d6$c03aa380$0646010a@IBM26B52F62DB0>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000201c804d6$c03aa380$0646010a@IBM26B52F62DB0>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vass Viktor <vass.viktor@zuriel.hu>
Cc: netfilter@vger.kernel.org

Hi,

On k, okt 02, 2007 at 11:29:37 +0200, Vass Viktor wrote:
> iptables v1.2.11: can't initialize iptables table `filter': iptables who?
> (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.

Do you have the necessary kernel modules loaded? (ip_tables and friends)

-- 
KOVACS Krisztian
