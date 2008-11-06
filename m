From: Simon <greminn@gmail.com>
Subject: Altering firewall rules to enable NAT Reflection
Date: Fri, 7 Nov 2008 12:25:51 +1300
Message-ID: <5bdb1aa70811061525h36988a9cr3db531232e4422d5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=4LLiomy47RkVlH3anxq/+YZgOlDuo10txyMeaJBZVFM=;
        b=KfKd1o+ozCh2pGzdscnlKNudAhfV4zD6cQqIYOiuBUkkLfENOyPdXiGQ13agl336FN
         nJ3qG1f4vfsxT9YhAxprrnZdwpVXuuy5WYEEz6Jhf+dHR+FSh4tV1eR9eYm0TrA6wa6G
         Joz149G5D2ktfCHw3XqMUTyQQu7EmC50YERo8=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi There,

Sorry if IPCOP is a bad word here :) but i could do with some
assistance OR a better suggestion!

We currently have a linksys ADSL modem with a fixed IP address on the
internet side and 192.168.1.0 on the internal side. We port forward
various ports to various ips on the internal network, including port
443 to our MS Exchange server. This all runs nice as the linksys does
"NAT Reflection" (is that the correct term?) so internal clients can
just connect to the external IP to get services from internal servers.

Now we have upgraded to VDSL (40Mbit, up from 5Mbit on ADSL) and the
router they have supplied does not do this. Well thats OK.. i can
setup the internal DNS so the external address points to internal IPs
- All well and good... until:

Iphones. According to Apple: The iphones push email setup does not
work if "your Exchange ActiveSync server has a different IP address
for intranet and Internet clients" (see
http://support.apple.com/kb/TS1868). And i can state that this is
correct.

So the first thing i thought, putting on my nubie hat, was to install
some sort of linux-based firewall so we can alter the firewall rules
to achieve the same. IPCOP is what i have used in the past, but no one
on the IPCOP forum or list can seem to be able to (or want to) help me
with this issue (no disrepect intended).

Any assistance in getting it sorted OR a better suggestion would be
very appeciated (please dont tell me to get new phones!)

Thanks

Simon
