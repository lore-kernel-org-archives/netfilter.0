From: Grozdan <neutrino8@gmail.com>
Subject: Blocking certain IP from accessing a specific port
Date: Fri, 28 Jan 2011 14:32:56 +0100
Message-ID: <AANLkTikaqTWofw7tS_=7iZoV52=3mm-eD7-VyDii5Ooq@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=2+pT6xQpLCz/uOXNDYHzDU17hjDR1RaVDafVZKITPCo=;
        b=lxbEw6VUqg7bdGdu0/T9DZcMbO3Jpdtqs2+PEZCe4DLyzfp37cuwMnB3BxsvwJtL3n
         QhTu3+W0ewGwCS1Im/am9FnYHBkdl6gnPIWpdIUp0KlhGS0JMyB3uPE9Qmv6NbiUEUT3
         sG468PKKkO9+2NO4ods9zsT/dIHiCpw34J3+I=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Very basic question due to a brain fart I'm having at the moment
(really tired as well), but if I want to block a certain IP address
from accessing a specific port on my server, would I be using --dport
or --sport on the INPUT chain?

Thanks :)
