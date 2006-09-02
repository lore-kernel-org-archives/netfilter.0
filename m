From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: how to set ports for ip_conntrack_ftp
Date: Sat, 2 Sep 2006 18:14:49 +0200
Message-ID: <002f01c6ceaa$ea521d50$0101000a@tanjian>
References: <20060902142907.GB31352@freesources.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060902142907.GB31352@freesources.org>
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

>> No.
>> You should edit your lilo.conf or grub.conf for this and look for the
>> line that says where your kernel is (probably: /boot/...). Append
>> "ip_conntrack_ftp.ports=21,31,41" to it.
>> Then, reboot the server.
> 
> as it is a production server, reboot is very complicated.

I already thought you were going to say this..

> there is absolutely no way to set the ports in a running system?

Not that I know of.


Gr,
Rob


