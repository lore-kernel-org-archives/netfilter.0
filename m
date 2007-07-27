From: "Ganesan Natarajan" <natrajputra@gmail.com>
Subject: Is netfilter hook and iptables rules are same?
Date: Fri, 27 Jul 2007 12:15:53 +0530
Message-ID: <dae53550707262345w823f34ase7d14039759e8ee1@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <kernelnewbies-bounce@nl.linux.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        b=CsmgRFCBZ6HXEuPUmW/b+oEN4XJT8QKyZ0tRXnd2pBToBL5xk1SdK2Sysq7lMcpU47XpgyvicnphfL6mqYiKKq37qUhYtQGMlbG3ubo5COrRVo3QofeIJn6Z8mpJ2wFqvaP+0/UMuGMTAAd47CMsNOCjh63l/bXTTev9mM+AKOA=
Content-Disposition: inline
Sender: kernelnewbies-bounce@nl.linux.org
Errors-to: kernelnewbies-bounce@nl.linux.org
List-help: <mailto:ecartis@nl.linux.org?Subject=help>
List-unsubscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=unsubscribe>
List-software: Ecartis version 1.0.0
List-Id: <netfilter.vger.kernel.org>
List-subscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=subscribe>
List-owner: <mailto:ecartis-owner@nl.linux.org>
List-post: <mailto:kernelnewbies@nl.linux.org>
List-archive: <http://mail.nl.linux.org/kernelnewbies/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, kernelnewbies@nl.linux.org

Hi all,
         What is the difference between the netfilter hooks and iptables rules?

Are both same?

If different, how the packet traverses through the stack?

What is the behaviour, if we insmod a netfilter hook at PRE_ROUTE to
drop the packet and insert a rule using iptables at PREROUTING chain
to QUEUE the packet?

Thanks
Ganesan

--
To unsubscribe from this list: send an email with
"unsubscribe kernelnewbies" to ecartis@nl.linux.org
Please read the FAQ at http://kernelnewbies.org/FAQ

