From: Aleksandr Levchuk <alevchuk@gmail.com>
Subject: One outgoing connection per process
Date: Tue, 6 Apr 2010 20:05:02 -0700
Message-ID: <k2ja39d6f081004062005y8a57e5cep53aad8ab9eceff19@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:received:message-id
         :subject:from:to:content-type;
        bh=ob9kdzz+mX9KAHjwfTML9KcI9lFZrFp6olptDIRMhKg=;
        b=C2GncwuAYjWT2/11zjf57L0p5gGenX0rpDbeHBfoKhBTzUCQkxgH0MiAftpHuTIIas
         kfSWLt0mgCy4o48p0w/2540GfonPXIvUW6HddA8U58X9A+qZlRIcM5VZkOGpCGeZm18Y
         mpU0x0LwpoZRFmC5q89b3rCCuZgId8dGbjd3U=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear Netfilter Community,

Is there a way to get Iptables to establish a limit of 1 outgoing TCP
connection per process?

Ideally I would like to dropping all new outgoing TCP connections from
a process if that process already has 1 outgoing connection.

Thank you.
Alex
