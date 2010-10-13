From: Red Cricket <red.cricket.blog@gmail.com>
Subject: sudo /sbin/iptables -v -t filter -A INPUT -p tcp --dport 22 -s
 124.225.122.167 -j REJECT does not stop ssh attack
Date: Wed, 13 Oct 2010 10:59:36 -0700
Message-ID: <AANLkTimbhPn+S63HvtvhOMZemGY5tGyzk-b1gjQUg_K5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=TQjLuCRxW7sWVpwMhxkSqhbHltdfdMN1Vowv3H45Gaw=;
        b=VUd9NMZPQJ4UBN1UEjeaS4m4tNJWkepOMH4Y0Oe5nzKvtY69P7uhpb0gyQ92BRbPp0
         Zzf65E4WCMuG1Gr7HXk35D94dDJaJozsQC5dZ27BYIcZPQBb89EEt6krUBMtQTe1p2Ah
         2d9ZRy/DI89u71es5nmXvb43i2xUgEwO7HRyk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Sorry for the long subject.

But I execute this on my system ...

sudo /sbin/iptables -v -t filter -A INPUT -p tcp --dport 22 -s
124.225.122.167 -j REJECT does not stop ssh attack

... yet message continue to scroll by in my /var/log/secure file

Oct 13 10:33:27 localhost sshd[28222]: Failed password for root from
124.225.122.167 port 36421 ssh2
Oct 13 10:33:27 localhost sshd[28223]: Received disconnect from
124.225.122.167: 11: Bye Bye
Oct 13 10:33:28 localhost sshd[28227]: pam_unix(sshd:auth):
authentication failure; logname= uid=0 euid=0 tty=ssh ruser=
rhost=124.225.122.167  user=root
Oct 13 10:33:30 localhost sshd[28227]: Failed password for root from
124.225.122.167 port 39871 ssh2
Oct 13 10:33:30 localhost sshd[28228]: Received disconnect from
124.225.122.167: 11: Bye Bye
Oct 13 10:33:32 localhost sshd[28232]: pam_unix(sshd:auth):
authentication failure; logname= uid=0 euid=0 tty=ssh ruser=
rhost=124.225.122.167  user=root
Oct 13 10:33:34 localhost sshd[28232]: Failed password for root from
124.225.122.167 port 43158 ssh2
Oct 13 10:33:34 localhost sshd[28233]: Received disconnect from
124.225.122.167: 11: Bye Bye


The messages eventually do stop but I cannot tell if that is because
iptables stopped it or the attacker just gave up?


Is there something wrong with my version of iptables or is my iptables
command no good?

Thanks
