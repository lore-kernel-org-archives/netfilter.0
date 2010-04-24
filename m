From: supercodeing35271 supercodeing35271 <supercodeing35271@gmail.com>
Subject: Dose netfilter can intercept the http method like the GET and POST?
Date: Sat, 24 Apr 2010 10:20:39 +0800
Message-ID: <m2w28efc0211004231920o2345ee66w3d39329cc73bad95@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=ekkRls0NpL/CMSWHOdWips3SqJD3qI/hASYlG4E2Oi0=;
        b=JAVFemt/jpDg+Sw9d6OnLZ58uzW5Z0OlIPZa/kSoMwwbBdRoRfd9M8uItSuVB2YV0e
         Nekt30Z7MlFPQJVpwKBPgbr7RLCS78iRCyCkoSZtDnPI7yk58/gGukLUz4IPM5ffMZ8c
         Ck2Wo4qx6K3OEBStm/ZkfyaYNx0+H3aexjnuA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,i just think about that does netfilter could doing a Application
Layer protection.
Assume there is a website which the server is Apache/Tomcat,and the
browser just submit the http/jsp form which contains a malicious
string for SQL or XSS attack.Now the netfilter program in the website
server get the string before send to Tomcat and check the string.
So does this could be done?And how to do it by netfilter?
