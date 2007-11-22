From: Quartexx <quartex73@gmail.com>
Subject: Fighting DOS attacks
Date: Thu, 22 Nov 2007 15:33:53 +0100
Message-ID: <4d7bf97f0711220633s36cc7b91x4ac07fa0064d4bff@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=5xhUzeJ7hiILEBRXC3GLI7AEiyVPxwWdEzspTaDtIn4=;
        b=PeMiNhV1k3eXT3qwATB9VqOLioMN3FsGOXIxHlW7dL3Mp7RNk7VPhOvAUGOMVF3zyUa/EIUVLzU76aNi+lPOEiQGmn+cXkpfiMIyfvJhTvp0ejUKmbSp8b7y52dQXGbWtZ3q2FME3ZY/dEJIKlT2BnR+zJs9zqaG6IG5SSO4njQ=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all.
I know this topic is already been treated.
The following kernel tunes are often reported on security books like
dos mitigators, still I would like to know your mind about these
kernel parameters settings:


echo 1 > /proc/sys/net/ipv4/tcp_syncookies
echo 30 > /proc/sys/net/ipv4/tcp_fin_timeout
echo 1800 >/proc/sys/net/ipv4/tcp_keepalive_time
echo 0 >/proc/sys/net/ipv4/tcp_window_scaling
echo 0 >/proc/sys/net/ipv4/tcp_sack
echo 0 >/proc/sys/net/ipv4/tcp_timestamps


Syncookies will help for sure.  Decreasing fin_timeout (from 60 to 30)
and keepalive_time (from 7200 to 1800) has any real benefits?

And what about turning off  tcp_window_scaling and tcp_sack?

Finally I think disabling tcp_timestamps is relevant only to disable
uptime detection...

As far as I can tell, all these options will only help the Linux
firewall box itself and will not do anything to assist the hosts that the
Linux box is being used to protect.
So basically these parameters must be set on every host behind
firewall.  Is this correct?

Thanks for your help and sorry for poor english.
