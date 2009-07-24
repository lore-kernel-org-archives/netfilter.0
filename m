From: "Nguyen Anh Dung" <serepok@gmail.com>
Subject: RE: Is there any patch that makes iptables get Dynamic Access List?
Date: Fri, 24 Jul 2009 16:27:44 +0700
Message-ID: <0B88570D519A4C2A9D72B6D56448FC3D@home>
References: <ff3811580907230706nfec2577ya45b538d02f6db85@mail.gmail.com>  <t31h65199vtd2hsuvetre90h7p53g56dmq@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:references:subject
         :date:message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer:thread-index:in-reply-to:x-mimeole;
        bh=62LtzeG1ELn0lTDPmMR4ktS8tBFkQpxA4B4kV9YyNQ4=;
        b=oCtNsnRCgzoVBPdsnNNGsocKosNtQfsO6xCPRWdjhGcVyAV+DMDTVVxKYhyJHi+EUg
         D+3DXnVITe6kb5zkI02p35VrCwhT1cKRX4pKnthDvEUp7Rxr+8qmS74BL0rpOzXGbq2q
         AVfTWzebH6bxk2vyaHCSvEho/xzD33Em4DD94=
In-Reply-To: <t31h65199vtd2hsuvetre90h7p53g56dmq@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
To make it more clear, you can look into this:
http://www.netcraftsmen.net/resources/archived-articles/534-looking-into-loc
k-and-key.html

Here's a formal list of what takes place in a Lock-And-Key session:
User Telnets to access server configured for Lock-And-Key.
User authentication takes place. Authentication from local access server or
RADIUS or TACACS+ (CiscoSecure). If user passes authentication, the IOS
software creates a temporary entry in the dynamic access list. The user
Telnet session is terminated at this time.
The user exchanges data through the firewall.
The IOS software deletes the temporary access list entry when a configured
timeout (idle or absolute) is reached, or when the system administrator
manually clears it. Note that the temporary entry can persist after the user
is done. If the absolute timeout kicks in while the user is still active,
the user must re-authenticate via another short-lived Telnet.

I think ipset is somewhat similar, but not sure :)

Thanks!
Dzung Nguyen

-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Andrew Schulman
Sent: Thursday, July 23, 2009 10:42 PM
To: netfilter@vger.kernel.org
Subject: Re: Is there any patch that makes iptables get Dynamic Access List?

> Dear all,
> I'm learning firewall in both Cisco and iptables. After a long time
> searching, i found no thing in iptables can compare to Cisco
> Lock-n-Key (Dynamic Access List) (i find in the Patch-O-Matic too).

I don't know what Lock-n-Key is, but if you want to filter on dynamically
changeable lists of IP or MAC addresses, then you probably want ipset:
http://ipset.netfilter.org/ .

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
No virus found in this incoming message.
Checked by AVG - www.avg.com 
Version: 8.5.392 / Virus Database: 270.13.26/2257 - Release Date: 07/23/09
18:00:00

